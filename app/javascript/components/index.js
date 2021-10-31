import { render } from 'react-dom'
import h from 'components/htm_create_element'
import Clock from 'components/clock'
import Chart from 'components/chart'

render(
  h`<${Chart} />`,
  document.getElementById("root")
)
