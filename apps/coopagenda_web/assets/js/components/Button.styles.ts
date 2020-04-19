import styled from "styled-components";

const Button = styled.button`
  background: transparent;
  border-radius: 3px;
  border: 2px solid palevioletred;
  color: palevioletred;
  margin: 0 1em;
  padding: 0.25em 1em;
`;

const Button__Icon = styled.span`
  ${Button}:hover & {
    background: red;
  }
`;

const Button__Text = styled.span`
  margin: 0 1em;
`;

export const Styled = {
  Button,
  Button__Icon,
  Button__Text,
};
