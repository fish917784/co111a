### iverilog 指令
iverilog -o 輸出檔名 輸入檔名  
vvp 輸出檔名
#### ex:
```
iverilog -o and and.v  
vvp and
```
元件都寫在 `chXX.v` 裡面，其他都是測試檔。

---

測試檔皆為參考老師測試檔並加以修改完成  
部分元件寫法也是參考自老師的[co/02-nand2tetris](https://gitlab.com/cccnqu111/co/-/tree/master/verilog/02-nand2tetris)  
05資料夾中的 `sum.asm` 及 `sum.hack` 是直接搬運自[co/02-nand2tetris](https://gitlab.com/cccnqu111/co/-/tree/master/verilog/02-nand2tetris)。
