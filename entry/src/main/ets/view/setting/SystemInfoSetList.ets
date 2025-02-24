import { ItemSetTextView } from "../../itemview/ItemSetTextView"

@ComponentV2
export struct SystemInfoSetList {
  build() {
    Scroll() {
      Column({ space: 24 }) {
        ItemSetTextView({ name: "设备编号",rightText:"1-010109010" })
        ItemSetTextView({ name: "本机房号",rightText:"01栋01单元0901房" })
        ItemSetTextView({ name: "本机IP",rightText:"192.168.1.26" })
        ItemSetTextView({ name: "本机子网掩码",rightText:"255.255.255.0" })
        ItemSetTextView({ name: "本机网关",rightText:"192.168.1.254" })
        ItemSetTextView({ name: "本机MAC",rightText:"00-55-52-39-18-22" })
        ItemSetTextView({ name: "中心服务器IP",rightText:"192.168.1.110" })
        ItemSetTextView({ name: "管理员机IP",rightText:"192.168.1.110" })
        ItemSetTextView({ name: "电梯控制器IP",rightText:"10.110.112.235" })
        ItemSetTextView({ name: "硬件版本",rightText:"SNF6251-100201-NOR" })
        ItemSetTextView({ name: "软件版本",rightText:"V01.01.0013_11:49:39_Jul 6 2022" })
      }
    }
    .padding({ left: 48, right: 48 })
  }
}