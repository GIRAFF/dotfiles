syn match langStatement "->"
syn match langStatement "[|&]\|="
syn match langNumber	"\d\+"
syn match langDelimiter "[<>]\|[<>=!]="
syn match langType "type_\d\+"
syn keyword langType corridor pallet
syn keyword langIdentifier x y w h ori_x ori_y

hi def link langNumber Number
hi def link langType Type
hi def link langStatement Statement
hi def link langIdentifier Identifier
hi def link langDelimiter Delimiter
