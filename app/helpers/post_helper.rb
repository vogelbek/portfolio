module PostHelper
  class PostPolicy
    attr_accessor :admin

    def initialize admin
      @admin = admin
    end

    def publish?
      @admin.role == 'editor'
    end
  end
end
