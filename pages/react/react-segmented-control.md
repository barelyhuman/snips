## Segment Control

### Usage

```jsx
<SegmentedControl>
    <SegmentedControl.Control active>Dashboard</SegmentedControl.Control>
    <SegmentedControl.Control>Timer</SegmentedControl.Control>
</SegmentedControl>
```

### Snippet

```jsx
import React, { useCallback, useState } from "react";
import styled from "styled-components";

const Container = styled.div`
  position: relative;
`;

const Nav = styled.nav`
  width: 100%;
  display: flex;
  gap: 10px;
  transition: clip-path 500ms cubic-bezier(0.91, 0.01, 0, 1.01);
  color: var(--subtle);

  & > button {
    padding: 6px;
    min-width: 10ch;
    margin-right: 16px;
    background: transparent;
    border: 0px;
    display: flex;
    color: inherit;
    align-items: center;
    justify-content: center;
  }

  &.overlay {
    display: flex;
    border-bottom: 2px solid black;
    top: 0;
    left: 0;
    position: absolute;
    color: var(--text);
    clip-path: inset(0px 100% 0px 0px);
  }
`;

function getActiveAreaStyle(containerNode, elementNode) {
  const navRect = containerNode.getBoundingClientRect();
  const buttonRect = elementNode.getBoundingClientRect();
  const right = navRect.right - buttonRect.right;
  const left = buttonRect.left - navRect.left;
  return {
    clipPath: `inset(0 ${right}px 0 ${left}px)`,
  };
}

export default function SegmentedControl({ className = "", children }) {
  const [activeBoundStyle, setActiveBoundsStyle] = useState({});

  const initialActiveBounds = React.useCallback((node) => {
    if (node === null) {
      return;
    }
    setActiveBoundsStyle({
      clipPath: "inset(0 100% 0 0)",
    });
  }, []);

  const makeActive = (element) => {
    const overlay = document.querySelector("#overlay-nav");
    if (!overlay) return;
    setActiveBoundsStyle(getActiveAreaStyle(overlay, element));
  };

  const modified = React.Children.map(children, (child) => {
    const modified = React.cloneElement(child, {
      makeActive: makeActive,
    });
    return modified;
  });

  return (
    <>
      <Container>
        <Nav className={`${className}`}>{modified}</Nav>
        <Nav
          id="overlay-nav"
          className={`overlay ${className}`}
          ref={initialActiveBounds}
          style={activeBoundStyle}
        >
          {modified}
        </Nav>
      </Container>
    </>
  );
}

SegmentedControl.Control = ({ makeActive, active, children, onClick }) => {
  const setInitialActive = useCallback(
    (node) => {
      if (active && node) {
        makeActive(node);
      }
    },
    [active]
  );

  return (
    <button
      ref={setInitialActive}
      onClick={(e) => {
        makeActive(e.target);
        onClick?.();
      }}
    >
      {children}
    </button>
  );
};
```
