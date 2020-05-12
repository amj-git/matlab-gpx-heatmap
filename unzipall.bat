@ECHO ON

SET SourceDir=D:\Users\Ade\Documents\Matlab\heatmap\data\activities
SET OutputDir=D:\Users\Ade\Documents\Matlab\heatmap\data\activities
FOR %%A IN ("%SourceDir%\*.gz") DO "D:\Program Files\7-Zip\7z.exe" x "%%~A" -o"%OutPutDir%\%%~NA"
::::FOR %A IN ("%SourceDir%\*.gz") DO "D:\Program Files\7-Zip\7z.exe" x "%~A" -o"%OutPutDir%\%~NA"
GOTO EOF