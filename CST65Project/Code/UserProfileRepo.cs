
using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/*********NOTE************
I modified the stored InerstUpdate procedure, to not overwrite the stored image
if the passed in value is null. This makes it possible to keep the current user
image when updating the uper profile. 

Also, your original stored procedure did not update age. Here is the updated bit of script.

GO
IF (OBJECT_ID('UserProfile_InsertUpdate') IS NOT NULL)
BEGIN
DROP PROCEDURE UserProfile_InsertUpdate
END
GO
CREATE PROCEDURE UserProfile_InsertUpdate
(
	@UserId UNIQUEIDENTIFIER,
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@Age INT,
	@PhoneNumber VARCHAR(15),
	@EmailAddress VARCHAR(50),
	@StreetAddress VARCHAR(50),
	@City VARCHAR(50),
	@State CHAR(2),
	@ZipCode CHAR(5),
	@ProfileImage image = NULL
)
AS
DECLARE @RecordCount INT;
SELECT @RecordCount = COUNT(*) FROM UserProfile WHERE UserId=@UserID;
IF @RecordCount = 0
BEGIN
	INSERT INTO UserProfile(UserId, FirstName, LastName, Age, PhoneNumber, EmailAddress, StreetAddress, City, State, ZipCode, ProfileImage)
	VALUES(@UserId, @FirstName, @LastName, @Age, @PhoneNumber, @EmailAddress, @StreetAddress, @City, @State, @ZipCode, @ProfileImage)
END
ELSE IF @ProfileImage IS NULL
BEGIN
	UPDATE UserProfile SET FirstName=@FirstName, LastName=@LastName, Age=@Age, PhoneNumber=@PhoneNumber, EmailAddress=@EmailAddress, StreetAddress=@StreetAddress, City=@City, State=@State, ZipCode=@ZipCode, ProfileImage=@ProfileImage
	WHERE UserId=@UserID
END
ELSE
BEGIN
	UPDATE UserProfile SET FirstName=@FirstName, LastName=@LastName, Age=@Age, PhoneNumber=@PhoneNumber, EmailAddress=@EmailAddress, StreetAddress=@StreetAddress, City=@City, State=@State, ZipCode=@ZipCode, ProfileImage=@ProfileImage
	WHERE UserId=@UserID
END
GO
GRANT EXECUTE ON UserProfile_InsertUpdate TO PUBLIC
****************************/

namespace CST65Project
{
    static class UserProfileRepo
    {
        public static UserProfileBO getUserProfile(Guid userGuid)
        {
            UserProfileBO returnMe = new UserProfileBO();
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["oitSqlServer"].ConnectionString);

            SqlCommand getUPobj = new SqlCommand();
            getUPobj.CommandText = "UserProfile_Get";
            getUPobj.CommandType = CommandType.StoredProcedure;
            getUPobj.Parameters.AddWithValue("@UserId", userGuid);
            getUPobj.Connection = connection;

            try
            {
                connection.Open();
                SqlDataReader reader = getUPobj.ExecuteReader();

                if (reader.Read())
                {
                    returnMe.UserID = (Guid)reader["UserID"];
                    returnMe.FirstName = reader["FirstName"].ToString();
                    returnMe.LastName = reader["LastName"].ToString();
                    returnMe.Age = (int)reader["Age"];
                    returnMe.PhoneNumber = reader["PhoneNumber"].ToString();
                    returnMe.Email = reader["EmailAddress"].ToString();
                    returnMe.EmailConfirm = returnMe.Email;
                    returnMe.StreetAddress = reader["StreetAddress"].ToString();
                    returnMe.City = reader["City"].ToString();
                    returnMe.State = reader["State"].ToString();
                    returnMe.Zipcode = reader["Zipcode"].ToString();
                    if (reader["ProfileImage"].GetType().ToString() != "System.DBNull")
                        returnMe.Image2 = (byte[])reader["ProfileImage"];
                }

                reader.Close();
            }
            catch
            {
                throw;
            }
            finally
            {
                connection.Close();
            }

            return returnMe;
        }

        public static void saveUserProfile(UserProfileBO saveMe)
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["oitSqlServer"].ConnectionString);
            SqlCommand saveUPobj = new SqlCommand();
            saveUPobj.CommandText = "UserProfile_InsertUpdate";
            saveUPobj.CommandType = CommandType.StoredProcedure;
            saveUPobj.Parameters.AddWithValue("@UserId", saveMe.UserID);
            saveUPobj.Parameters.AddWithValue("@FirstName", saveMe.FirstName);
            saveUPobj.Parameters.AddWithValue("@LastName", saveMe.LastName);
            saveUPobj.Parameters.AddWithValue("@Age", saveMe.Age);
            saveUPobj.Parameters.AddWithValue("@PhoneNumber", saveMe.PhoneNumber);
            saveUPobj.Parameters.AddWithValue("@EmailAddress", saveMe.Email);
            saveUPobj.Parameters.AddWithValue("@StreetAddress", saveMe.StreetAddress);
            saveUPobj.Parameters.AddWithValue("@City", saveMe.City);
            saveUPobj.Parameters.AddWithValue("@State", saveMe.State);
            saveUPobj.Parameters.AddWithValue("@ZipCode", saveMe.Zipcode);
            saveUPobj.Parameters.AddWithValue("@ProfileImage", saveMe.Image2);
            saveUPobj.Connection = connection;

            try
            {
                connection.Open();
                saveUPobj.ExecuteNonQuery();
            }
            catch
            {
                throw;
            }
            finally
            {
                connection.Close();
            }
        }
    }
}
