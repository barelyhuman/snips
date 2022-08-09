### Algorithm | Availability Ranges

```jsx
import { format } from "@barelyhuman/date-utils";

const startOfDay = new Date(new Date().setHours(0, 0, 0));
const endOfDay = new Date(new Date().setHours(23, 59, 59));
const oneOClock = new Date().setHours(1, 0, 0);
const twoOClock = new Date().setHours(2, 0, 0);
const fourOClock = new Date().setHours(4, 0, 0);
const sixOClock = new Date().setHours(6, 0, 0);

const initialRange = [
  {
    from: startOfDay,
    to: endOfDay,
    space: 3,
  },
];

const dateInMills = (date) => {
  return new Date(date).getTime();
};

const pointIsBetween = (range, point) => {
  return (
    dateInMills(range.from) <= dateInMills(point) &&
    dateInMills(point) <= dateInMills(range.to)
  );
};

const pointIsAfter = (range, point) => {
  return (
    dateInMills(point) >= dateInMills(range.from) &&
    dateInMills(point) >= dateInMills(range.to)
  );
};

const pointIsBefore = (range, point) => {
  return (
    dateInMills(point) <= dateInMills(range.from) &&
    dateInMills(point) <= dateInMills(range.to)
  );
};

const block = (rangeToCheck, toBlock) => {
  // Cases
  // [done] equal to the whole range, return empty array
  // [done] inbetween one range => split range and leave remaining as is
  // [done] one value inbetween range => split range into two
  // [done] fully equal to existing range => remove range and leave remaining as is
  // [done] add spaces , remove 1 on each overlap and containment but not on split ups

  console.log(
    `----
Blocking ${format("hh:mm:ss", toBlock.from)} to ${format(
      "hh:mm:ss",
      toBlock.to
    )}`
  );

  const availableRanges = [];

  rangeToCheck.forEach((element) => {
    // console.log({
    //   element: {
    //     from: format("hh-mm-ss", element.from),
    //     to: format("hh-mm-ss", element.to),
    //     space: element.space,
    //   },
    //   toBlock: {
    //     from: format("hh-mm-ss", toBlock.from),
    //     to: format("hh-mm-ss", toBlock.to),
    //   },
    // });

    if (
      pointIsBetween(toBlock, element.from) &&
      pointIsBetween(toBlock, element.to)
    ) {
      if (element.space - 1 > 0) {
        availableRanges.push({
          ...element,
          space: element.space - 1,
        });
      } else {
        availableRanges.push({
          from: element.to,
          to: toBlock.to,
          space: element.space,
        });
      }
    }

    if (
      pointIsBetween(element, toBlock.from) &&
      pointIsBetween(element, toBlock.to)
    ) {
      availableRanges.push({
        from: element.from,
        to: toBlock.from,
        space: element.space,
      });

      if (element.space - 1 > 0) {
        availableRanges.push({
          from: toBlock.from,
          to: toBlock.to,
          space: element.space - 1,
        });
      }

      availableRanges.push({
        from: toBlock.to,
        to: element.to,
        space: element.space,
      });
    }

    if (pointIsAfter(element, toBlock.from)) {
      availableRanges.push(element);
    }

    if (pointIsBefore(element, toBlock.to)) {
      availableRanges.push(element);
    }
  });

  return availableRanges
    .filter((item) => item.from !== item.to)
    .sort((x, y) => dateInMills(x.from) - dateInMills(y.from));
};

let available = block(initialRange, { from: oneOClock, to: fourOClock });
bulkPrintRange(available);

available = block(available, { from: oneOClock, to: twoOClock });
bulkPrintRange(available);

available = block(available, { from: oneOClock, to: endOfDay });
bulkPrintRange(available);

available = block(available, { from: twoOClock, to: sixOClock });
bulkPrintRange(available);

function bulkPrintRange(rangeCollection) {
  rangeCollection.forEach(printRange);
}

function printRange(range) {
  console.log("---xxx---");
  console.log("From:", format("hh:mm:ss", range.from));
  console.log("To:", format("hh:mm:ss", range.to));
  console.log("Space:", range.space);
}
```

