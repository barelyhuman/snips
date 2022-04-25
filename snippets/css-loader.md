### CSS | Simple Loader

```css
.loader {
  display: block;
  position: fixed;
  z-index: 1031;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 18px;
  height: 18px;
  box-sizing: border-box;
  border: solid 2px transparent;
  border-top-color: #000;
  border-left-color: #000;
  border-bottom-color: #efefef;
  border-right-color: #efefef;
  border-radius: 50%;
  -webkit-animation: loader 400ms linear infinite;
  animation: loader 400ms linear infinite;
}

@-webkit-keyframes loader {
  0% {
    -webkit-transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
  }
}
@keyframes loader {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
```

[&larr; Back](/)

2022 &copy; [reaper](https://reaper.im)
