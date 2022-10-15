require "user_account_repository"

RSpec.describe UserAccountRepository do

    def reset_user_accounts_table
        seed_sql = File.read('spec/seeds_user_account.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test2' })
        connection.exec(seed_sql)
    end
  
describe UserAccountRepository do
        

    before(:each) do 
    reset_user_accounts_table
    end

    describe "#all" do
        it "returns an array of all user_account details" do
            repo = UserAccountRepository.new

            user_account = repo.all
            # expect(user_account.length).to eq 1
            expect(user_account[0].email).to eq 'makers@hotmail.com'
            expect(user_account[0].username).to eq 'makers1'
        end
    end

    describe "#find" do
        it "returns user_account by id" do
            repo = UserAccountRepository.new

            user_account = repo.find(1)
            expect(user_account.email).to eq 'makers@hotmail.com'
            expect(user_account.username).to eq 'makers1'
        end
    end

    describe "#create" do

        it "creates a user_account and checks it exists" do

            repo = UserAccountRepository.new
            new_user_account = UserAccount.new

            new_user_account.email = 'new@hotmail.com'
            new_user_account.username = 'newuser'

            repo.create(new_user_account)

            results = repo.all

            last = results.last

            expect(last.email).to eq 'new@hotmail.com'
            expect(last.username).to eq 'newuser'
        end
    end

    describe "#delete" do

        it "deletes a user_account and checks if the length exists" do
            repo = UserAccountRepository.new
            repo.delete(1)

            results = repo.all

            expect(results.length).to eq 0
        end
    end
end
end