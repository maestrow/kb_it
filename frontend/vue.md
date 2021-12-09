## Links

- [api](https://vuejs.org/v2/api/)
- [Intro to Vue: video course](https://www.vuemastery.com/courses/intro-to-vue-js)
- [A curated list of awesome things related to Vue.js](https://github.com/vuejs/awesome-vue)

## Vuejs devtools

https://chrome.google.com/webstore/detail/vuejs-devtools/ljjemllljcmogpfapbkkighbhhppjdbg?hl=en

После установки расширения можно из консоли обращаться к объекту приложения как к глобальной переменной.

## App config

    var app = new Vue({
        el: '#app',
        data: {...},
        methods: {..},
        computed: {...}
    });

## Expressions

    {{ expression }}
    v-bind:href="expression" or :href
    :key="key_expression"
    v-for:"item in items"
    v-for:"(item, index) in items"

Events:
    
    v-on:click="expression" or @click="onClick"

Style binding:

    <p :style="{ backgroundColor: item.bgColor }">...</p>
    <p :style="{ 'background-color': item.bgColor }">...</p>
    <p :style="{ 'background-color': item.bgColor }">...</p>
    <p :style="background-color: 13px">...</p>
    <p :style="styleObject">...</p>
    <p :style="[styleObject1, styleObject2]">...</p>

    <div
        class="static"
        v-bind:class="{ active: isActive, 'text-danger': hasError }"
    ></div>

## Components

Vue.component('product', {
    props: {
        message: {
            type: String,
            required: true,
            default: 'hi'
        }
    },
    template: `<div>{{message}}</div>`,
    render: function (createElement) {...},
    data() { return {...}; },
    methods: {..},
    computed: {...}
});

<product message="hello!"></product>

## Способ описания разметки компонентов

- внутри html файла
- внутри свойства template
- .vue
- <script type="text/x-template">

## QA

- What is the best practice? - global registration vs local

## Tools

styleguidist
storybook

Расширения для vscode:

- переименование имен компонентов. 
- autocomplete шаблонов.

Библиотеки:

- axios
- vuex
- router

## Random

Scoped styles.