import React from "react";
import { Styled } from './Button.styles';

export interface Props {
  iconName: string;
}

const Button: React.FC<Props> = (props) => (
  <Styled.Button>
    <Styled.Button__Icon className={`icon ${props.iconName}`}></Styled.Button__Icon>
    <Styled.Button__Text>{props.children}</Styled.Button__Text>
  </Styled.Button>
);

export default Button;
