class Ability
  include CanCan::Ability

  def initialize(user)
    # puts user.id
    # Define abilities for the user here.

    # Ability to read Food resources
    # can :read, Food

    # Ability to read Recipe resources
    can :manage, Food
    can :read, Recipe
    can :create, Recipe
    can :create, Inventory
    # Ability to deny reading Inventory resources
    cannot :read, Inventory
    

    # Ability to manage (create, update, delete) all resources if user is the owner
          can :manage, :all do |resource|
        # Check if the resource has a user_id attribute and if the user is the owner
        resource.respond_to?(:user_id) && resource.user_id == user.id
      end

    # return unless user.id == user_id
    # can :manage, :all, user_id: user.id

    # Define abilities for the user here. For example:
    #
    #   return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
