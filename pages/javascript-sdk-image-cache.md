### Javascript | In Memory Cache for Network Data

```js
import idx from 'idx';
import {SDK} from './sdk';

const cache = new Map();

const mapToObj = c => Object.fromEntries(c.entries());

export async function fetchImagesFromCache(ids) {
  const toFetch = [];

  ids.forEach(id => {
    if (cache.has(id)) if (cache.get(id).expiry > new Date().getTime()) return;
    toFetch.push(id);
  });

  if (!toFetch.length) return mapToObj(cache);

  const response = await SDK.getFileUrl(toFetch);
  const imageData = idx(response, _ => _.data.getFileUrl.data) || [];
  imageData.forEach(item => {
    const expiry = new Date();
    expiry.setTime(expiry.getTime() + 30 * 1000);

    cache.set(item.id, {
      ...item,
      expiry: expiry.getTime(),
    });
  });

  return mapToObj(cache);
}
```