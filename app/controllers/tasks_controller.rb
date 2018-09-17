TASKS = [ {school: 'do cs fundamentals'}, {school: 'read notes'}, {school: 'finish homework'}]


class TasksController < ApplicationController
    def index
      @tasks = TASKS
    end
end
