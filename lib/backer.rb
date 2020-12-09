class Backer
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
        project_backer_instances = ProjectBacker.all.select do |project_backer|
            project_backer.backer == self
        end

        project_backer_instances.map do |pbi|
            pbi.project
        end
    end

end