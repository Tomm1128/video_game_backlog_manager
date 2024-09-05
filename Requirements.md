## Requirements

1. **Use the Ruby on Rails framework.**

2. **Models Requirements:**
   - Your models must include a `has_many`, a `belongs_to`, and at least two `has_many :through` relationships.
   - You may include more models to fill out your domain, but there must be at least one model acting as a join for one of the `has_many :through` relationships.
   - Ensure that every table has at least two simple attributes outside its timestamps and foreign keys. For example, a `Ticket` model may contain `seat` and `departure_time` attributes.
   - [X] I met this criteria by having a has many through relationshipo on User and Video Game. I also have a collections video game join table. 

3. **Validations:**
   - Your models should include reasonable validations for their attributes.
   - You don't need to add every possible validation, but the models should defend against invalid data.
   - [X] I have validations for each model and form to protect against invalid data. 

4. **ActiveRecord Scopes:**
   - Include at least one class-level ActiveRecord scope method.
   - Scopes are conceptually and syntactically simple. Read the Rails documentation to learn how to write a scope.
   - Scopes can power specific features, such as "My Overdue Tasks" in a TODO application, where you might scope all tasks for a user by datetime to find overdue items (e.g., `@user.tasks.overdue`).
   - [X] I have a scope method in the video game model.

5. **User Authentication:**
   - Implement standard user authentication, including signup, login, logout, and passwords.
   - You can use Devise, but you are also free to roll your own authentication logic if desired.
   - [X] I created my own auth with session controller with all the ncessary views. 

6. **Nested Resources:**
   - Make use of a nested resource with appropriate RESTful URLs.
   - Your nested resource must provide a form that relates to the parent resource.
   - For example, if representing user profiles with RESTful URLs like `/profiles/1`, you might represent pictures as a nested resource with URLs like `/profiles/1/pictures` and `/profiles/1/pictures/new` for adding new pictures to profile 1.
   - [X] I have nested resources when adding a review and adding a video game to a collection.

7. **Validation Error Display:**
   - Ensure that forms correctly display validation errors, with messages describing any validation failures visible within the view.
   - [X] I made sure that each form displays validation errors

8. **Testing:**
   - Your application should contain unit tests for all models and at least one integration test.
   - The integration test can be a controller test, request test, feature test, or system test.
   - Add `rspec-rails` to your Gemfile and initialize it.
   - Reach out to a TA or instructor for guidance on appropriate tests to add.
   - Use Relish documentation to learn more about different types of tests in RSpec and how to set them up.
   - [X] I created tests for each model and a integration test for signing in to the app. 

9. **FactoryBot:**
   - Use FactoryBot to build instances of your models in your test suite.
   - Add `factory_bot_rails` to your Gemfile.
   - [X] I have factory bots for each model as needed for testing.

10. **DRY Principles:**
    - Ensure that your application follows DRY (Don't-Repeat-Yourself) principles.
    - Encapsulate logic present in controllers as methods in models.
    - Use helper methods and partials in views to minimize logic.
    - Follow patterns in the Rails Style Guide and the Ruby Style Guide.

11. **Linting:**
    - Your application should conform to Nitro's Ruby linting conventions.
    - Copy the `.rubocop.yml` from the provided repo to your application.
    - Running `rubocop` from your application's root should return a "no offenses detected" message.
    - Add `rubocop` and `rubocop-performance` to your Gemfile.

12. **README.md:**
    - Include a `README.md` with a description of the project and an installation guide (e.g., fork and clone repo, migrate db, bundle install, etc).

13. **No Scaffolding:**
    - Do not use scaffolding to build your project.
    - The goal is to learn, and scaffolding is designed to get up and running quickly but does not offer the same learning experience.
