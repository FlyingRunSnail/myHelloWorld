# tcp_ip
----
1.以太网类型字段及各类型对应值 <br>

|  目的MAC | 源MAC | 类型 |  payload  | FCS   |

ethernet II类型以太网帧的最小长度64Bytes(6 + 6 + 2 + 46 +4)，最大长度1518Bytes(6 + 6 + 2 +1500 + 4)  <br>
| 序号 | 协议类型 | 类型值 |
|------|------|------|
| 1 | IPV4 | 0x0800|
| 2 | ARP | 0x0806|
|3|PPPOE|0x8864|
|4|802.1Q|0x8100|
|5|IPV6|0x86DD|
|6|MPLS|0x8847|

2.上述类型字段与长度字段是复用的，其值大于0x0600时表示协议类型，否则表示长度 <br>











参考文档： <br>
https://blog.csdn.net/eydwyz/article/details/65446328 <br>