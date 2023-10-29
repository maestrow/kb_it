## pnpm doens't generate bin

Unfortunately pnpm doesn't create bin subfolder when you install packages `pnpm install`. 

- https://github.com/pnpm/pnpm/issues/1801 
- pnpm -v 8.6.1

## How to Create package-lock.json

Source: https://github.com/orgs/pnpm/discussions/3367#discussioncomment-2919171

Generate a `package-lock.json` file without installing dependencies in node_modules:

    npm i --package-lock-only

> I was only using pnpm for demo projects to save disk space because I needed a package-lock.json on the CI servers, but it looks like I can just generate it via npm while keeping the node_modules symlinked to a central store. I think this means I can now use pnpm for work projects too. 

See https://stackoverflow.com/a/54910009/552792