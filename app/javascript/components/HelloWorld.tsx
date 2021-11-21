// TODO テストファイル(サンプル実装（後に削除対象）)
import React from "react"

type Props = {
  greeting: string
}

const HelloWorld: React.VFC<Props> = ({ greeting }) => {
  return <>
    Greetingts: {greeting}
    <div>Test</div>
    <h1>Test</h1>
  </>
}

export default HelloWorld