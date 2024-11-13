control 'SV-213788' do
  title 'SQL Server must implement and/or support cryptographic mechanisms to prevent unauthorized modification of organization-defined information at rest (to include, at a minimum, PII and classified information) on organization-defined information system components.'
  desc 'Databases holding data requiring "data at rest" protections must employ cryptographic mechanisms to prevent unauthorized disclosure and modification of the information at rest. These cryptographic mechanisms may be native to the DBMS or implemented via additional software or operating system/file system settings, as appropriate to the situation.

Selection of a cryptographic mechanism is based on the need to protect the integrity of organizational information. The strength of the mechanism is commensurate with the security category and/or classification of the information. Organizations have the flexibility to either encrypt all information on storage devices (i.e., full disk encryption) or encrypt specific data structures (e.g., files, records, or fields).

The decision whether and what to encrypt rests with the data owner and is also influenced by the physical measures taken to secure the equipment and media on which the information resides.'
  desc 'check', 'Review the system documentation to determine whether the organization has defined the information at rest that is to be protected from modification, which must include, at a minimum, PII and classified information.

If no information is identified as requiring such protection, this is not a finding.

Review the configuration of SQL Server, Windows, and additional software as relevant.

If full-disk encryption is required, and Windows or the storage system is not configured for this, this is a finding.

If database transparent data encryption (TDE) is called for, check whether it is enabled:
In SQL Server Management Studio, Object Explorer, expand the instance and right-click on the database name; select properties.  Select the Options page, State section, Encryption Enabled parameter.

If the value displayed is False, this is a finding.

If column encryption, done via SQL Server features, is required, review the definitions and contents of the relevant tables and columns.

If any of the information defined as requiring cryptographic protection is not encrypted in a manner that provides the required level of protection, this is a finding.'
  desc 'fix', 'Where full-disk encryption is required, configure Windows and/or the storage system to provide this.

Where transparent data encryption (TDE) is required, deploy the necessary stack of certificates and keys, and set the Encryption Enabled to True.  For guidance from the Microsoft Developer Network on how to do this, perform a web search for "SQL Server 2014 TDE".

Where column encryption is required, deploy the necessary stack of certificates and keys, and enable encryption on the columns in question.  For guidance from the Microsoft Developer Network on how to do this, perform a web search for "SQL Server 2014 Encrypt a Column of Data".'
  impact 0.5
  ref 'DPMS Target MS SQL Server 2014 Database'
  tag check_id: 'C-15008r312442_chk'
  tag severity: 'medium'
  tag gid: 'V-213788'
  tag rid: 'SV-213788r961599_rule'
  tag stig_id: 'SQL4-00-034700'
  tag gtitle: 'SRG-APP-000428-DB-000386'
  tag fix_id: 'F-15006r312443_fix'
  tag 'documentable'
  tag legacy: ['SV-81899', 'V-67409']
  tag cci: ['CCI-002475']
  tag nist: ['SC-28 (1)']

  data_at_rest_encryption_required = attribute('data_at_rest_encryption_required')

  query = %{
    SELECT
          d.name AS [Database Name],
          CASE e.encryption_state
                WHEN 0 THEN 'No database encryption key present, no encryption'
                WHEN 1 THEN 'Unencrypted'
                WHEN 2 THEN 'Encryption in progress'
                WHEN 3 THEN 'Encrypted'
                WHEN 4 THEN 'Key change in progress'
                WHEN 5 THEN 'Decryption in progress'
                WHEN 6 THEN 'Protection change in progress'
          END AS [Encryption State]
    FROM sys.dm_database_encryption_keys e
    RIGHT JOIN sys.databases d ON DB_NAME(e.database_id) = d.name
    WHERE d.name IN ('#{attribute('db_name')}')
  }

  sql_session = mssql_session(user: attribute('user'),
                              password: attribute('password'),
                              host: attribute('host'),
                              instance: attribute('instance'),
                              port: attribute('port'),
                              db_name: attribute('db_name'))

  unless data_at_rest_encryption_required
    impact 0.0
    desc 'If the application owner and Authorizing Official have
    determined that encryption of data at rest is NOT required, this is not a
    finding.'
  end

  describe "Database: #{attribute('db_name')} encryption state" do
    subject { sql_session.query(query).column('encryption state').uniq }
    it { should cmp 'Encrypted' }
  end

  describe 'The following checks must be performed manually' do
    skip "The following checks must be performed manually:
      If full-disk encryption is required, and Windows or the storage system is not
      configured for this, this is a finding.

      If database transparent data encryption (TDE) is called for, check whether it
      is enabled:
      In SQL Server Management Studio, Object Explorer, expand the instance and
      right-click on the database name; select properties.  Select the Options page,
      State section, Encryption Enabled parameter.

      If the value displayed is False, this is a finding.

      If column encryption, done via SQL Server features, is required, review the
      definitions and contents of the relevant tables and columns.

      If any of the information defined as requiring cryptographic protection is not
      encrypted in a manner that provides the required level of protection, this is a
      finding.

      If table/column encryption and/or a separation between those who own the data
      (and can view it) and those who manage the data (but should have no access) is
      required for PII or similar types of data, use Always Encrypted. The details
      for configuring Always Encrypted are located here:
      https://msdn.microsoft.com/en-us/library/mt163865.aspx.

      Review the definitions and contents of the relevant tables/columns for the
      Always Encryption settings, if any of the information defined as requiring
      cryptographic protection is not encrypted this is a finding."
  end
end
