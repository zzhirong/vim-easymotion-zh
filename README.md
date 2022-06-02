Patch EasyMotion to easy motion in Chinese text. 基于小鹤双拼让 EasyMotion 识别中文.

Inspired by [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs).

### 演示视频

https://user-images.githubusercontent.com/627330/171558035-183c576a-ab21-4b93-88ed-1c3e912e853b.mp4

### 动机

- 很喜欢 EasyMotion 这个插件, 它让跳转变得更加便捷, 但是它只能以字母为跳转目标, 不能识别中文.
- 我平时中文写得比较多, 经常需要定位到某个文字, 之前我只能通过鼠标单击来完成, 但这样做的话会让打字效率变低, 偶然间看到 EasyMotion 对日语的支持, 后又看到一个插件[vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs)实现了对中文的识别, 但这个插件还是没达到我想要的效果, 于是我着手基于小鹤双拼来重新实现一遍, 发现最终做成的插件达到理想的效果, 所以把它共享出来, 希望它能帮助到有类似需求的人.

### 和 [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs) 的不同之处:

- 基于[小鹤双拼](https://www.flypy.com/)编码实现, 而不是全拼实现.
- 去除了大量的生僻字.
- 增加了对中文符号支持, 比如`<Plug>(easymotion-f).`可以识别`。`和`.`.
- 增加了对`<Plug>(easymotion-s2)/<Plug>(easymotion-*-f2)`支持, 比如`<Plug>(easymotion-s2)le`会识别拼音为`le`的单字(了, 乐, 勒).

### 先决条件(Requirement)

- 需要安装 [EasyMotion](https://github.com/easymotion/vim-easymotion).
- 必须设置`let g:EasyMotion_use_migemo = 1`.
- 如果只用到根据单字母跳转, 比如`<Plug>(easymotion-f)`, 则只需要熟悉[小鹤双拼](https://www.flypy.com/)的声母是如何分布在 26 个字母按键上的, 大部分都和声母一一对应(声母 m ->按键 M, 声母 n -> 按键 N, ...), 有几个特例:
    - `zh` 对应按键 `V`
    - `sh` 对应按键 `U`
    - `ch` 对应按键 `I`
- 如果需要通过声母和韵母定位跳转到单字, 比如`<Plug>(easymotion-s2)de`定位到所有的`的, 地, 得`, 则还需要熟悉[小鹤双拼](https://www.flypy.com/)的韵母的键位分布, 这个需要花点时间(不超过 1 小时), 举些简单的例子:
    - 韵母`an`分布在按键`J`上 
    - 韵母`uo`分布在按键`O`上
    - 韵母`ue`分布在按键`T`上

### 参考配置

```vim
Plug 'zzhirong/vim-easymotion-zh'
Plug 'easymotion/vim-easymotion'
    let g:EasyMotion_leader_key=";"
    let g:EasyMotion_skipfoldedline=0
    let g:EasyMotion_space_jump_first=1
    let g:EasyMotion_move_highlight = 0
    let g:EasyMotion_use_migemo = 1
    noremap s <Plug>(easymotion-overwin-f2)
    " `s` 和 surround 冲突, 比如 ds
    onoremap z <Plug>(easymotion-f2)
    noremap f <Plug>(easymotion-fl)
    noremap F <Plug>(easymotion-Fl)
    noremap t <Plug>(easymotion-tl)
    noremap T <Plug>(easymotion-Tl)
    noremap ;. <Plug>(easymotion-repeat)
    noremap ;l <Plug>(easymotion-next)
    noremap ;h <Plug>(easymotion-prev)
```

### 安装(Install)

推荐通过[vim-plug](https://github.com/junegunn/vim-plug)安装:
- `Plug 'easymotion/vim-easymotion'`
- `Plug 'zzhirong/vim-easymotion-zh'`.

### 通过单字符跳转, 适用`<Plug>(easymotion-f)`等, 例如跳转到`是`(声母是`sh`, 对应按键为`U`).

- `<Plug>(easymotion-f)` + `U`

### 通过双字符跳转使用方法, 比如跳转到`是`(声母`sh`, 对应`U`, 韵母`i`, 对应`I`).

- `<Plug>(easymotion-s2)` + `U` + `I`
- 相对单字符跳转优势: 重码少, 候选位置更少, 可适用于跨多行跳转.

### 为什么使用双拼？

- 单字编码长度刚好是 2, 满足`<Plug>(easymotion-s2)`要求。
- 最开始, 想尝试使用相邻两个字的声母作为`s2`的参数，但任意两个声母组成的组合长度从几百到几万不等，比如`ss`组成的可能就多达几万种，反而由单个声母加韵母组合长度可以控制在一百以内.

### 使用的双拼方案是什么?

- [小鹤双拼](https://www.flypy.com/)

### 可能存在的问题
- 不熟悉[小鹤双拼](https://www.flypy.com/).
- 生僻字无法定位。
- 使用的是[EasyMotion](https://github.com/easymotion/vim-easymotion)不稳定的接口, 后续该插件升级可能会导致本插件无法使用.
