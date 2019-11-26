=begin
#SCORM Cloud Rest API

#REST API used for SCORM Cloud integrations.

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'

module RusticiSoftwareCloudV2

  class CourseActivitySchema
    # An arbitrary identifier that the external LMS system can associate with this LearningObject to track it as it isreused across courses 
    attr_accessor :external_identifier

    # The string which identifies this activity in the context of its course
    attr_accessor :item_identifier

    # The string which identifies this activity's resource in a course's manifest
    attr_accessor :resource_identifier

    # The type of activity this is
    attr_accessor :activity_type

    # The web path used to launch this activity
    attr_accessor :href

    # The score required of a learner to pass this activity
    attr_accessor :scaled_passing_score

    # The title of the activity
    attr_accessor :title

    attr_accessor :children

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'external_identifier' => :'externalIdentifier',
        :'item_identifier' => :'itemIdentifier',
        :'resource_identifier' => :'resourceIdentifier',
        :'activity_type' => :'activityType',
        :'href' => :'href',
        :'scaled_passing_score' => :'scaledPassingScore',
        :'title' => :'title',
        :'children' => :'children'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'external_identifier' => :'String',
        :'item_identifier' => :'String',
        :'resource_identifier' => :'String',
        :'activity_type' => :'String',
        :'href' => :'String',
        :'scaled_passing_score' => :'String',
        :'title' => :'String',
        :'children' => :'Array<CourseActivitySchema>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'externalIdentifier')
        self.external_identifier = attributes[:'externalIdentifier']
      end

      if attributes.has_key?(:'itemIdentifier')
        self.item_identifier = attributes[:'itemIdentifier']
      end

      if attributes.has_key?(:'resourceIdentifier')
        self.resource_identifier = attributes[:'resourceIdentifier']
      end

      if attributes.has_key?(:'activityType')
        self.activity_type = attributes[:'activityType']
      end

      if attributes.has_key?(:'href')
        self.href = attributes[:'href']
      end

      if attributes.has_key?(:'scaledPassingScore')
        self.scaled_passing_score = attributes[:'scaledPassingScore']
      end

      if attributes.has_key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.has_key?(:'children')
        if (value = attributes[:'children']).is_a?(Array)
          self.children = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      activity_type_validator = EnumAttributeValidator.new('String', ["UNKNOWN", "AGGREGATION", "SCO", "ASSET", "OBJECTIVE"])
      return false unless activity_type_validator.valid?(@activity_type)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] activity_type Object to be assigned
    def activity_type=(activity_type)
      validator = EnumAttributeValidator.new('String', ["UNKNOWN", "AGGREGATION", "SCO", "ASSET", "OBJECTIVE"])
      unless validator.valid?(activity_type)
        fail ArgumentError, "invalid value for 'activity_type', must be one of #{validator.allowable_values}."
      end
      @activity_type = activity_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          external_identifier == o.external_identifier &&
          item_identifier == o.item_identifier &&
          resource_identifier == o.resource_identifier &&
          activity_type == o.activity_type &&
          href == o.href &&
          scaled_passing_score == o.scaled_passing_score &&
          title == o.title &&
          children == o.children
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [external_identifier, item_identifier, resource_identifier, activity_type, href, scaled_passing_score, title, children].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = RusticiSoftwareCloudV2.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
