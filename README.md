Patch EasyMotion to motion easily in Chinese. 基于双拼码表让 EasyMotion 识别中文.

Inspired by [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs).

和 [vim-easymotion-chs](https://github.com/ZSaberLv0/vim-easymotion-chs) 的不同之处:
- 基于[小鹤双拼](https://www.flypy.com/)编码实现, 而不是全拼实现.
- 去除了大量的生僻字.
- 增加了对中文符号支持, 比如`?`.
- 增加了对`<Plug>easymotion-s2/<Plug>easymotion-*-f2`支持.

### 先决条件(Requirement)
- 需要安装 [EasyMotion](https://github.com/easymotion/vim-easymotion).
- 如果只用到根据单字母跳转, 比如`<Plug>easymotion-f`, 则只需要熟悉[小鹤双拼](https://www.flypy.com/)的声母是如何分布在 26 个字母上的, 其实只需要记住几个特殊的:
    - `zh` 对应 `V`
    - `sh` 对应 `U`
    - `ch` 对应 `I`
- 如果需要通过双字母跳转, 比如`<Plug>easymotion-s2`, 则还需要熟悉[小鹤双拼](https://www.flypy.com/)的韵母分布, 这个需要花点时间(不超过 1 小时).

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
- 单字编码长度刚好是 2, 满足`<Plug>easymotion-s2`要求。
- 最开始, 想尝试使用相邻两个字的声母作为`s2`的参数，但任意两个声母组成的组合长度从几百到几万不等，比如`ss`组成的可能就多达几万种，反而由单个声母加韵母组合长度可以控制在一百以内.

### 使用的双拼方案是什么?
- [小鹤双拼](https://www.flypy.com/)

### 可能存在的问题
- 生僻字无法定位。
- 使用的是[EasyMotion](https://github.com/easymotion/vim-easymotion)不稳定的接口, 后续该插件升级可能会导致本插件无法使用.
