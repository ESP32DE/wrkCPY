pngimage.zip

-> Folder obj
-> pngimage.pas
-> pngextra.pas
-> pnglang.pas
-> zlibpas.pas
-> PngDelphi.chm


if you want png support in project
expand the zip to a lib folder
append folder for search libs 

append in 

uses pngimage 

append a var

lGraphic: TGraphic; 

create your png graphic object
lGraphic := TPNGObject.Create;

----------------------------------------

if you want support only png in project

append in

uses pngimage

now you can load and save png format
example:

Image1.Picture.LoadFromFile('TestMe.png');
or
Image1.Picture.SaveToFile('TestMe.png');


 