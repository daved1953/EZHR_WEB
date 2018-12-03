


/*  change the name of the object as needed */

Create Procedure TemplateSqlCodingObject
(@Codeobjectname varchar(50),
 @SourceTablename varchar(50)
 )
 as 

Declare @objectname varchar(50)

set @objectname = @Codeobjectname

 select  column_name , data_type ,
   column_name + ' as ' + replace(column_name,'#','num') + ' ,' as Select_fields,
  'public ' + 
    case data_type
			 when 'int' then 'Int32 ' 
			 when 'varchar' then 'string '
			 when 'nvarchar' then 'string '
			 when 'datetime' then 'DateTime '
			 when 'datetime2' then 'DateTime '
			 when 'numeric' then 'decimal '  
			 when 'float' then 'decimal '
			 When 'Date' then 'Date '
			 When 'Time' then 'time '
			 when 'smallint' then 'Int16 '
			 when 'bit' then 'bool '
			 when 'bool' then 'Boolean '
			 when 'decimal' then 'decimal ' 
			 else ' UNKNOWN '
			 end
	  + replace(column_name,'#','num') + ' {get;set;} ' as Object_properties,
	   @objectname + '.' + replace(column_name,'#','num')+ ' '
	    +  case data_type
			 when 'int' then '= result.GetInt32(result.GetOrdinal("' 
			 when 'varchar' then  ' = result.GetString(result.GetOrdinal("'  
			 when 'nvarchar' then '= result.GetString(result.GetOrdinal("'
			 when 'datetime' then ' = result.GetDateTime(result.GetOrdinal("'
			 when 'datetime2' then ' = result.GetDateTime(result.GetOrdinal("'
			 when 'numeric' then ' = result.GetDecimal(result.GetOrdinal("'
			 when 'float' then ' = result.GetDecimal(result.GetOrdinal("'
			 When 'Date' then ' = result.GetDateTime(result.GetOrdinal("'
			 When 'Time' then ' = result.GetDateTime(result.GetOrdinal("'
			 when 'smallint' then ' = result.GetInt16(result.GetOrdinal("'
			 else  ' = result.GetOBJECT(result.GetOrdinal("'
			   end
        +  replace(column_name,'#','')   + '")); ' as DataReaderLoader

 from information_schema.columns
  where table_name = @SourceTablename
  order by column_name;

  go 
