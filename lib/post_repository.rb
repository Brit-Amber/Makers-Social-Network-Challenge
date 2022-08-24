require_relative './post.rb'

class PostRepository

    def all

        sql = "SELECT * FROM posts;"
        result = DatabaseConnection.exec_params(sql, [])

        result = result.map do |res|
            post = Post.new
            post.id = res["id"].to_i
            post.title = res["title"]
            post.content = res["content"]
            post.views = res["views"].to_i
            post.user_account_id = res["user_account_id"].to_i

            res = post
        end
        
    end

    def find(id)

        sql = 'SELECT * FROM posts WHERE id = $1'
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
        res = result[0]

        post = Post.new
        post.id = res["id"].to_i
        post.title = res["title"]
        post.content = res["content"]
        post.views = res["views"].to_i
        post.user_account_id = res["user_account_id"].to_i

        post
    end

    def create(post)
        sql = 'INSERT INTO posts (title, content, views, user_account_id) VALUES ($1, $2, $3, $4);'
        params = [post.title, post.content, post.views, post.user_account_id]
        result = DatabaseConnection.exec_params(sql, params)
    end

    def delete(id)
        sql = "DELETE FROM posts WHERE id = $1"
        params = [id]
        result = DatabaseConnection.exec_params(sql, params)
    end

end
