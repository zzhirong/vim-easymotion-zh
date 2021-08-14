Patch EasyMotion to motion easily in Chinese. 基于双拼码表让 EasyMotion 识别中文.

Inspired by [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs).

和 [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs) 的不同之处:
- 基于[小鹤双拼](https://www.flypy.com/)编码实现，而不是全拼实现。
- 去除了大量的生僻字。
- 增加了对中文符号支持, 比如`?`。
- 增加了对`<Plug>easymotion-*-f2`支持。

### 安装
- 通过[vim-plug](https://github.com/junegunn/vim-plug): `Plug zzhirong/vim-easymotion-zh`.

### 双字符跳转使用方法, 比如跳转到`我`.
- `<Plug>(easymotion-s2)` + `声母所在编码(w)` + `韵母所在的编码(o)`
- 相对单字符跳转优势: 重码少。

### 为什么使用双拼？
- 编码长度刚好是 2，满足`<Plug>easymotion-*-s2`要求。
- 最开始，我也想尝试使用相邻两个字的声母作为`s2`的参数，但任意两个声母组成的可能有几白到几万种，比如`ss`组成的可能就多达几万种，反而由单个声母加韵母，重码可以控制在一百一内。

### 使用的双拼方案是什么？
- [小鹤双拼](https://www.flypy.com/)
