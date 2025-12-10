-- Get the current machine name
DECLARE @MachineName NVARCHAR(128) = CONVERT(NVARCHAR(128), SERVERPROPERTY('MachineName'));
DECLARE @CurrentServerName NVARCHAR(128) = @@SERVERNAME;

-- Check if the current server name is different from the machine name
IF @MachineName <> @CurrentServerName
BEGIN
    -- Drop the existing server registration if it's incorrect
    EXEC sp_dropserver @CurrentServerName;

    -- Add the correct machine name
    EXEC sp_addserver @MachineName, 'local';
    
    -- Restart SQL Server (this part cannot be done via SQL script directly, so you need to manually restart)
    PRINT 'The server name has been updated. Please restart SQL Server for the changes to take effect.';
END
ELSE
BEGIN
    PRINT 'The server name is already correct. No change is needed.';
END
