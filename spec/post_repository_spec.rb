require "post_repository"

RSpec.describe PostRepository do

    def reset_posts_table
        seed_sql = File.read('spec/seeds_posts.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test2' })
        connection.exec(seed_sql)
    end
  
describe PostRepository do
        
    before(:each) do 
        reset_posts_table
    end

    describe "#all" do
        it "returns an array of all entries" do
            repo = PostRepository.new

            posts = repo.all
            expect(posts.length).to eq 1
            expect(posts[0].title).to eq 'yes'
            expect(posts[0].content).to eq 'no'
            expect(posts[0].views).to eq 100
            expect(posts[0].user_account_id).to eq 1
        end
    end

    describe "#find" do
        it "returns posts by id" do
            repo = PostRepository.new

            posts = repo.find(1)
            expect(posts.title).to eq 'yes'
            expect(posts.content).to eq 'no'
            expect(posts.views).to eq 100
            expect(posts.user_account_id).to eq 1
        end
    end

    describe "#create" do

        it "creates an entry and checks it exists" do

            repo = PostRepository.new
            new_post = Post.new

            new_post.title = 'maybe'
            new_post.content = 'myb'
            new_post.views = 125
            new_post.user_account_id = 1

            repo.create(new_post)

            results = repo.all

            last = results.last

            expect(last.title).to eq 'maybe'
            expect(last.content).to eq 'myb'
            expect(last.views).to eq 125
            expect(last.user_account_id).to eq 1

        end
    end

    describe "#delete" do

        it "deletes an entry and checks if the length exists" do
            repo = PostRepository.new
            repo.delete(1)

            results = repo.all

            expect(results.length).to eq 0
        end
    end
end
end
