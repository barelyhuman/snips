### Javascript | Unique Array Using Sets

```jsx
sourceArray.reduce((acc, item) => {
  if (!acc.has(item.id)) {
    uniqueArray.push(item);
    acc.add(item.id);
  }

  return acc;
}, new Set());
```

[&larr; Back](/)

2022 &copy; [reaper](https://reaper.im)
