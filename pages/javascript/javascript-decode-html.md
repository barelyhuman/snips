### Javascript | Decode HTML Strings

```js
function decodeHtml(htmlString) {
  var tArea = document.createElement("textarea");
  tArea.innerHTML = htmlString;
  return tArea.value;
}
```
