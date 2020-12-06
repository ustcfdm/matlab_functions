function data=ReadRaw(s_file,data_size,s_format)
%data=readRaw(s_file,data_size,s_format)
%example:
%data=readRaw('sample.raw',[512 512 1],'float32')
fid=fopen(s_file,'r','l');
data_size_total=cumprod(data_size);
data_size_total=data_size_total(end);
data=fread(fid,data_size_total,s_format);
data=reshape(data,data_size);
fclose(fid);