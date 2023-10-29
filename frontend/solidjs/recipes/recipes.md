## How to pass signal as chidren

```
export const DoesntWork: ParentComponent<JSX.ButtonHTMLAttributes<HTMLButtonElement>> = ({ children, ...rest }) => {
  return <button {...rest}>{children}</button>
}

export const Work1: ParentComponent<JSX.ButtonHTMLAttributes<HTMLButtonElement>> = p => {
  const { children, ...rest } = p;
  return <button {...rest}>{p.children}</button>
}

export const Work2: ParentComponent<JSX.ButtonHTMLAttributes<HTMLButtonElement>> = (p) => {
  return <button>{p.children}</button>
}
```

