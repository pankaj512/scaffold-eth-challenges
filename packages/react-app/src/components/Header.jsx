import { PageHeader } from "antd";
import React from "react";

// displays a page header

export default function Header({ title, subTitle }) {
  return (
    <div style={{ textAlign: "start" }}>
      <a href="https://github.com/austintgriffith/scaffold-eth" target="_blank" rel="noopener noreferrer">
        <h1 style={{ marginBottom: "1px" }}>{title}</h1>
        <div>{subTitle}</div>
      </a>
    </div>
  );
}

Header.defaultProps = {
  title: "🏗 scaffold-eth",
  subTitle: "forkable Ethereum dev stack focused on fast product iteration",
};
