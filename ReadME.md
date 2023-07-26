This is a terraform repository to test fucntions such as count, element, lookup, map,
for each, dynamic blocking, chomp, etc. also added files for povisioners with null resource, local files to replace .tpl templates to get ansible inventory files with 
private instances of the deployed instances. also one more provisioner to install to copy local files and other for local exec.

Provisioners not working properly, both with inside the resource and null resource, only working when we destroy the whole infra and recreating it. Not even when we taint that resource. 
when in res, throwing a cycle dependency error, with 3 instances.



