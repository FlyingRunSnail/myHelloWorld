# aloha
--------
1.时隙：aloha <br>
2.时隙帧：前导 + 时隙单元 + 保护间隔 + 时隙单元 + 保护间隔 ... <br>
3.时隙的作用：　<br>
  用于端站（小站）向中心站（主站）单向发送信令消息 <br>
4.时隙的分配 <br>
  中心站（主站）通过连续载波给其下的小站分配时隙，该过程是在软件的控制下进行 <br>
5.小站如何使用时隙 <br>
  当小站分配到时隙后会在属于自己的时隙时间范围内向主站发送信令消息 <br>
６.设备在未分配到时隙时，使用竞争时隙 <br>
7.D系列与aloha相关的命令字及实现情况 <br>
命令字                                                           响应函数                                    是否实现 <br>
LeafMdm_AlohaParam            SyMUComm_LeafMdm_AlohaParam_Set          否   <br>
LeafMdm_AlohaInfo                SyMUComm_LeafMdm_AlohaInfo_Set              否   <br>
LeafMdm_AlohaLinkInfo            SyMUComm_LeafMdm_AlohaLinkInfo_Set       是   <br>
LeafMdm_AlohaＭode            SyMUComm_LeafMdm_AlohaMode_Set           是   <br>
LeafMdm_AlohaAdjlist            SyMUComm_LeafMdm_AlohaAdjlist_Set           是  注：D2S使用 <br>
LeafMdm_AlohaClean      　   SyMUComm_LeafMdm_AlohaClean_Set           否   <br>
LeafMdm_AlohaAdjlist1Get     SyMUComm_LeafMdm_AlohaAdjlist1_Get        是   注：D2S使用<br>
LeafMdm_AlohaAdjlist2Get     SyMUComm_LeafMdm_AlohaAdjlist2_Get        是   注：D2S使用<br>
LeafMdm_AlohaAdjlist3Get     SyMUComm_LeafMdm_AlohaAdjlist3_Get        是   注：D2S使用<br>
LeafMdm_AlohaAdjlist4Get     SyMUComm_LeafMdm_AlohaAdjlist4_Get        是   注：D2S使用<br>
LeafMdm_AlohaInfoOffline     SyMUComm_LeafMdm_AlohaInfoOffline_Set     是   <br>
LeafMdm_AlohaInfoOnline     SyMUComm_LeafMdm_AlohaInfoOnline_Set     是   <br>
LeafMdm_DevWorkMode       SyMUComm_LeafMdm_DevWorkMode_Set       是   <br>
8.NCR对Aloha的影响 <br>
D系列要求判断NCR时钟是否锁定，同时在参考时钟为内时钟前提下才认为此时可以配置aloha相关参数 <br>
Ｅ系列未对NCR时钟锁定做判断，只在告警中巡检是否有NCR未锁定告警 <br>
9.相关寄存器 <br>

10.备注 <br>
<font face="微软雅黑" color=red>时隙偏差值寄存器地址： <br> </font>
ALOHA_ERR_DAT_Ｈ　　0x4A90　<br>
ALOHA_ERR_DAT_L　　   0x4A91   <br>
Ｅ系列中已经由逻辑自动校正，软件并没有设置时隙偏差值，Ｄ系列中有实现该接口，但AlohaAdjlist Set和Get只有D2S使用，D2E移植中暂时不用，直接返回成功。<br>
11.关于调制模式与编码方式 <br>
在调试aloha过程中发现，同１种调制方式在不同编码下对应不同的waveId。在Ｅ系列中waveId与modCode有映射关系，modCode即为映射表的index，waveId即为映射表的中的值。 D系列是通过调制模式和ratio两个参数来映射到waveId。在d2e中为了适配这种方式，又增加了１张映射表，通过该表实现从调制模式和ratio到modCode的映射，再通过Ｅ系列的接口设置下去，Ｅ系列中会查询前面提到的映射表，最终转换成waveId后设置到FPGA中<br>
                  FEC_1_2                                                   modCode为查询下表的index <br>
　　　　－－－－－－－－   　　　　　　　　　　　 －－－－－－－－－－－         <br>
bpsk　｜　　2　　　　　 ｜   (2即modCode）　==>  | 0 1 X　　　　　　　　　|     (根据modCode得到waveId X)    <br>
　　　｜　　　　　　　　｜　　　　　　　　　　　－－－－－－－－－－－    <br>
　　　｜　　　　　　　　｜ <br>
　　　｜　　　　　　　　｜ <br>
　　　　－－－－－－－－  <br>
