class CommentPolicy < ApplicationPolicy
  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && (user.editor? || user.author?)
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end
end
