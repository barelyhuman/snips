### Javascript | Decode HTML Strings

```js
function decodeHtml(htmlString) {
  var tArea = document.createElement("textarea");
  tArea.innerHTML = htmlString;
  return tArea.value;
}
```

[&larr; Back](/)

2022 &copy; [reaper](https://reaper.im)
