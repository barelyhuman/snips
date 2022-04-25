### Javascript | Copy to Clipboard

Simple code to use both the current `Clipboard API` and the fallback `textarea` method to copy code to clipboard

```js
function copyToClipboard(strToCopy) {
  navigator.permissions.query({ name: "clipboard-write" }).then((result) => {
    if (result.state == "granted" || result.state == "prompt") {
      navigator.clipboard.writeText(strToCopy).then(
        function () {
          // ignore and digest
        },
        function () {
          return fallBackCopy(strToCopy);
        }
      );
    } else {
      return fallBackCopy(strToCopy);
    }
  });
}

function fallBackCopy(strToCopy) {
  const el = document.createElement("textarea");
  el.value = strToCopy;
  el.setAttribute("readonly", "");
  el.style.position = "absolute";
  el.style.left = "-9999px";
  document.body.appendChild(el);
  el.select();
  document.execCommand("copy");
  document.body.removeChild(el);
}
```

[&larr; Back](/)

2022 &copy; [reaper](https://reaper.im)
