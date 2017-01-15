require "kemal"
require "./kemal-rest-api/*"
require "./kemal-rest-api/adapters/*"

module KemalRestApi
  DEBUG = false

  last_exception = ""

  enum ActionMethod
    CREATE
    READ
    UPDATE
    DELETE
    LIST
  end

  enum ActionType
    GET
    POST
    PUT
    PATCH
    DELETE
  end

  error 400 do |env|
    env.response.content_type = "application/json"
    { "message": "Bad Request" }.to_json
  end

  error 401 do |env|
    env.response.content_type = "application/json"
    { "message": "Unauthorized" }.to_json
  end

  error 404 do |env|
    env.response.content_type = "application/json"
    { "message": "Not Found" }.to_json
  end

  error 500 do |env|
    env.response.content_type = "application/json"
    { "message": "Internal Server Error" }.to_json
  end
end
