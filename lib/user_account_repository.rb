require_relative './user_account.rb'

class UserAccountRepository

    def all
          # Executes the SQL query:
          # SELECT id, name, cohort_name FROM students;
      
          # Returns an array of Student objects.
    end
      
        # Gets a single record by its ID
        # One argument: the id (number)
    def find(id)
          # Executes the SQL query:
          # SELECT id, name, cohort_name FROM students WHERE id = $1;
      
          # Returns a single Student object.
    end

    def create(user_account)

        #

    end

    def delete

        # Add more methods below for each operation you'd like to implement.
      
        # def create(student)
        # end
      
        # def update(student)
        # end
      
        # def delete(student)
        # end
      end
end
