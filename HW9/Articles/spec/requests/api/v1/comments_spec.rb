require 'swagger_helper'

RSpec.describe 'api/v1/comments', type: :request do

  path '/api/v1/comments/{comment_id}/unpublished' do
    # You'll want to customize the parameter types...
    parameter name: 'comment_id', in: :path, type: :string,
              description: 'show unpublished comment by comment_id'

    get('unpublished comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:comment_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/comments/{comment_id}/published' do
    # You'll want to customize the parameter types...
    parameter name: 'comment_id', in: :path, type: :string,
              description: 'show published comment by comment_id'

    get('published comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:comment_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/comments/{comment_id}/change_status' do
    # You'll want to customize the parameter types...
    parameter name: 'comment_id', in: :path, type: :string,
              description: 'change status comments by comment_id to published/unpublished'

    patch('change_status comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:comment_id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/comments' do

    get('list comments') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :path, description: 'Show all comments'
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create comment') do
      tags 'Comments'
      consumes 'application/json'
      request_body_example value: { body: 'basic', status: 1, author_id: 10, article_id: 10 }
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          body: { type: :string },
          status: { type: :integer },
          author_id: { type: :integer },
          article_id: {type: :integer}
        }, description: 'Create comment',
        required: %w[body status author_id article_id]
      }
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { body: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'show comment by id'

    get('show comment') do
      tags 'Comments'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    patch('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :id, in: :path, description: 'update comment by id'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    put('update comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :id, in: :path, description: 'update comment id'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete comment') do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :id, in: :path, description: 'Delete comment by id'
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
