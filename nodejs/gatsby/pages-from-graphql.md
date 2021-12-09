# Подключение GraphQL, чтение mdx файлов с frontmatter

Задача: Отображать по некоторому шаблону статьи из папки с кнтентом. Иметь возможность отобразить список статей. Статьи хранятся в формате mdx. Задача близка к тому, что предлагает стартер https://github.com/gatsbyjs/gatsby-starter-blog. Поэтому вопросы по реализации и лучшей практике было очень удобно подсматривать в исходниках этого стартера. 

## Как расширить состав полей нод?

Пример использования:

Предлоложим, что плагин gatsby-source-filesystem настроен для нескольких источников. В одном из них у вас посты для блога и вы хотите отобрать только эти md-файлы. В запросе allMdx нет возможности получить sourceInstanceName родительского элемента (файла). А следовательно и нет возможности отфильтровать Mdx файлы по источнику (по корневой папке). Для решения проблемы можно самостоятельно расширить состав полей нод типа Mdx:

```
exports.onCreateNode = ({ node, actions: { createNodeField }, getNode }) => {
  if (node.internal.type === `Mdx`) {
    const { sourceInstanceName } = getNode(node.parent)
    createNodeField({
      name: `sourceInstanceName`,
      node,
      value: sourceInstanceName,
    })
  }
}
```

Источник: https://github.com/gatsbyjs/gatsby/discussions/30395#discussioncomment-514374


## Как определить схему для frontmatter?

Предположим, что вы хотите обрабатывать определенный набор полей frontmatter в md-файлах. Например: title, subtitle, date. Если на некоторых момент ни в одном существующем файле не будет поля subtitle, тогда запрос graphql на получение этого поля выдаст ошибку. Данная проблема обсуждалась в issue [Allow non-existing fields in GraphQL Queries
](https://github.com/gatsbyjs/gatsby/issues/2392#issuecomment-526637536), решение в отмеченном коментарии. Таже решение видно и здесь: https://github.com/gatsbyjs/gatsby-starter-blog/blob/master/gatsby-node.js (метод createSchemaCustomization). Для удобства приведем решение здесь:

gatsby-node.js:
```js
exports.createSchemaCustomization = ({ actions }) => {
  const { createTypes } = actions

  // taken from https://github.com/gatsbyjs/gatsby-starter-blog/blob/master/gatsby-node.js
  createTypes(`
    type Mdx implements Node {
      frontmatter: Frontmatter
      fields: Fields
    }
    type Frontmatter {
      title: String
      subtitle: String
      description: String
      type: String
      tags: [String]
      date: Date @dateformat
      disabled: Boolean
    }
    type Fields {
      sourceInstanceName: String
    }
  `)
}
```

## Как создать странички (Pages) для каждого элемента из определенного источника данных?

В оффициальном [туториале](https://www.gatsbyjs.com/docs/tutorial/part-6/) предлагается использовать шаблон вида `src/pages/{mdx.slug}.js`. Таким образом все ноды mdx преобразуются странички и для паттерна пути будет исползовано поле slug (для mdx - это относительный путь до файла). Однако для большего контроля, например, если вы хотите самостоятельно написать запрос на получение данных контента, тогда нужно всять пример с https://github.com/gatsbyjs/gatsby-starter-blog/blob/master/gatsby-node.js: для этого в gatsby-node.js используется метод createPages:

```js
exports.createPages = async ({ graphql, actions, reporter }) => {
  const { createPage } = actions
  const tpl = path.resolve(`./src/templates/article.jsx`)

  const result = await graphql(
    `
      {
        allMdx(
          filter: {fields: {sourceInstanceName: {eq: "content"}}}, 
          limit: 1000
        ) {
          nodes {
            id
            slug
          }
        }
      }
    `
  )

  if (result.errors) {
    reporter.panicOnBuild(
      `There was an error loading your articles`,
      result.errors
    )
    return
  }

  const posts = result.data.allMdx.nodes

  // Create articles pages
  // `context` is available in the template as a prop and as a variable in GraphQL

  if (posts.length > 0) {
    posts.forEach((post, index) => {
      createPage({
        path: post.slug,
        component: tpl,
        context: {
          id: post.id,
        },
      })
    })
  }
}
```