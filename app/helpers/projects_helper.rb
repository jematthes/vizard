module ProjectsHelper
  @@locked_icon = "fa fa-lock"
  @@unlocked_icon = "fa fa-unlock"
  @@done_icon = "fa fa-check"
  
  def icon_class element, requirement = true
    return @@locked_icon unless requirement
    element.blank? ? @@unlocked_icon : @@done_icon
  end

  def icon_class_stage stage
    case stage
    when 1
      (@real_problem && @policy_problems && @solutions) ? "fa fa-check-circle" : "fa fa-times-circle"
    when 2
      @objectives.blank? ? "fa fa-times-circle" : "fa fa-check-circle"
    end
  end

  def link_text element_symbol
    case element_symbol
    when :real_problem
      @real_problem.blank? ? 'Articulate the real-world problem children are facing that you want to address' : @real_problem.title
    when :policy_problems
      @policy_problems.blank? ? "Identify policy dimensions of the 'real-world' problem" : " #{@policy_problems.size} Policy problems"
    when :solutions
      @solutions.blank? ? "Policy solutions: Describe the main policy solutions that would constitute an appropriate response" : " #{@solutions.size} Solutions"
    when :objectives
      @objectives.blank? ? 'Add and prioritize objectives' : " #{@objectives.size} Objectives"
    end
  end

  def objective_link_text objective, element_symbol
    case element_symbol
    when :actors
      objective.actors.blank? ? "List actors and power map" : " #{objective.actors.size} Actors"
    when :enabling_factors
      objective.enabling_factors.blank? ? "Identify enabling factors and barriers" : " #{objective.enabling_factors.size} Enabling Factors and #{objective.barriers.size} Barriers"
    when :outcomes
      objective.outcomes.blank? ? "Define the interim outcomes and activities" : " #{objective.outcomes.size} Outcomes"
    end
  end
end
