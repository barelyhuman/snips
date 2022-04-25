### React Component | Padding

```jsx
export default ({ children, x, y, all, ...props }) => {
  const multiplier = 8;

  if (all && typeof all !== "number") {
    all = 0;
  }

  if (x && typeof x !== "number") {
    x = 0;
  }

  if (y && typeof y !== "number") {
    y = 0;
  }

  const style = {
    padding: {
      paddingTop: all * multiplier || y * multiplier || 0,
      paddingRight: all * multiplier || x * multiplier || 0,
      paddingLeft: all * multiplier || x * multiplier || 0,
      paddingBottom: all * multiplier || y * multiplier || 0,
    },
  };
  return (
    <>
      <div style={style.padding}>{children}</div>
    </>
  );
};
```

[&larr; Back](/)

2022 &copy; [reaper](https://reaper.im)
