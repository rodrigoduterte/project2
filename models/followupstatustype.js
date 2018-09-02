module.exports = function(sequelize, DataTypes) {
  var FollowupStatusType = sequelize.define("FollowupStatusType", {
    name: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true
    }
  });
  FollowupStatusType.associate = function(models) {
    FollowupStatusType.hasMany(models.FollowUp, {
      onDelete: "restrict"
    });
    FollowupStatusType.hasMany(models.FollowupActionType, {
      onDelete: "restrict"
    });
  };
  return FollowupStatusType;
};
