require_relative './user_account.rb'

class UserAccountRepository

    def all
        sql = "SELECT * FROM user_accounts;"
        result = DatabaseConnection.exec_params(sql, [])

        user_accounts = []

        result = result.map do |res|
            user_account = UserAccount.new
            user_account.id = res["id"].to_i
            user_account.email = res["email"]
            user_account.username = res["username"]

        user_accounts << user_account
    end
        return user_accounts
    end     


    def find(id)

        sql = 'SELECT * FROM user_accounts WHERE id = $1'
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
        res = result[0]
    
        user_account = UserAccount.new
        user_account.id = res["id"].to_i
        user_account.email = res["email"]
        user_account.username = res["username"]
    
        user_account
        
    end

    def create(user_account)
        sql = 'INSERT INTO user_accounts (email, username) VALUES ($1, $2);'
        params = [user_account.email, user_account.username]
        result = DatabaseConnection.exec_params(sql, params)
    end

    def delete(id)
        sql = "DELETE FROM user_accounts WHERE id = $1"
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
    end
end
