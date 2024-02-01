# Linux utils

## Unibackup

Jedná se o prosté zálohování pomocí rsync, které bylo doplněno o možnost definovat v externích souborech něco navic:

* unibackup_include_list.txt - seznam cest co se bude zálohovat
* unibackup_exclude_list.txt - seznam definicí, co se nebude zálohovat
* unibackup.log - log provedených záloh

## Examples

Pár příkladů podmínek pro linuxový bash:

* Podmínka zda je den lichý nebo sudý
* Podmínka zda je týden lichý nebo sudý
* Podmínka zda rozdíl mezi daty větší než 10 dnů
