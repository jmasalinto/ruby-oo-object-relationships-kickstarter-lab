class Project
    attr_reader :title
    @@all = []

    def initialize(title)
        @title = title
        @@all << self
    end

    def self.all
        @@all
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        ProjectBacker.all.select do |project|
            project.backer == self
        end
    end

    def backers
        project_backer_instances = ProjectBacker.all.select do |project_backer|
            project_backer.project == self
        end

        project_backer_instances.map do |pbi|
            pbi.backer
        end
    end

end