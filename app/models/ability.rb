class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    return unless user.present?

    can :read, Group, author_id: user.id

    # Users can read the movements that they own.
    can :read, Movement, author_id: user.id

    # Users can create new groups and movements.
    can :create, Group
    can :create, Movement

    # Users can update and delete groups and movements that they own.
    can %i[update destroy], Group, author_id: user.id
    can %i[update destroy], Movement, author_id: user.id
    return unless user.admin?

    can :manage, :all
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
