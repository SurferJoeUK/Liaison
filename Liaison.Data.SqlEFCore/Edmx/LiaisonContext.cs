using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

#nullable disable

//PM> Scaffold-DbContext "Data Source=.;Initial Catalog=Liaison;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework" Microsoft.EntityFrameworkCore.SqlServer 
namespace Liaison.Data.SqlEFCore.Edmx
{
    public partial class LiaisonContext : DbContext
    {
        public LiaisonContext()
        {
        }

        public LiaisonContext(DbContextOptions<LiaisonContext> options)
            : base(options)
        {
        }

        public virtual DbSet<AdminCorp> AdminCorps { get; set; }
        public virtual DbSet<AdminCorpsUnit> AdminCorpsUnits { get; set; }
        public virtual DbSet<Aircraft> Aircraft { get; set; }
        public virtual DbSet<AltCode> AltCodes { get; set; }
        public virtual DbSet<Base> Bases { get; set; }
        public virtual DbSet<ConfigSetting> ConfigSettings { get; set; }
        public virtual DbSet<Dictionary> Dictionaries { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<DocumentLink> DocumentLinks { get; set; }
        public virtual DbSet<DocumentReference> DocumentReferences { get; set; }
        public virtual DbSet<EquipmentOwner> EquipmentOwners { get; set; }
        public virtual DbSet<GroundEquipment> GroundEquipments { get; set; }
        public virtual DbSet<GroundEquipmentType> GroundEquipmentTypes { get; set; }
        public virtual DbSet<Mission> Missions { get; set; }
        public virtual DbSet<MissionUnit> MissionUnits { get; set; }
        public virtual DbSet<MissionUnitPlusUnitNumber> MissionUnitPlusUnitNumbers { get; set; }
        public virtual DbSet<Organisation> Organisations { get; set; }
        public virtual DbSet<Rank> Ranks { get; set; }
        public virtual DbSet<Relationship> Relationships { get; set; }
        public virtual DbSet<RelationshipType> RelationshipTypes { get; set; }
        public virtual DbSet<Service> Services { get; set; }
        public virtual DbSet<ServiceType> ServiceTypes { get; set; }
        public virtual DbSet<Ship> Ships { get; set; }
        public virtual DbSet<ShipClass> ShipClasses { get; set; }
        public virtual DbSet<ShipClassMember> ShipClassMembers { get; set; }
        public virtual DbSet<ShipPrefix> ShipPrefixes { get; set; }
        public virtual DbSet<SortOrder> SortOrders { get; set; }
        public virtual DbSet<TaskForce> TaskForces { get; set; }
        public virtual DbSet<Tennant> Tennants { get; set; }
        public virtual DbSet<TennantPlusUnitNumber> TennantPlusUnitNumbers { get; set; }
        public virtual DbSet<Translation> Translations { get; set; }
        public virtual DbSet<Unit> Units { get; set; }
        public virtual DbSet<UnitIndex> UnitIndices { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                //#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.

                optionsBuilder.UseSqlServer("Data Source=.;Initial Catalog=Liaison;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AdminCorp>(entity =>
            {
                entity.HasKey(e => e.AdminCorpsId);

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.DisplayName).HasMaxLength(255);

                entity.Property(e => e.Lookup).HasMaxLength(5);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.SortName).HasMaxLength(255);

                entity.Property(e => e.UnitDisplayName).HasMaxLength(255);

                entity.HasOne(d => d.ParentUnit)
                    .WithMany(p => p.AdminCorps)
                    .HasForeignKey(d => d.ParentUnitId)
                    .HasConstraintName("FK_AdminCorps_Unit");
            });

            modelBuilder.Entity<AdminCorpsUnit>(entity =>
            {
                entity.HasKey(e => new { e.AdminCorpsId, e.UnitId });

                entity.HasOne(d => d.AdminCorps)
                    .WithMany(p => p.AdminCorpsUnits)
                    .HasForeignKey(d => d.AdminCorpsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AdminCorpsUnits_AdminCorps");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.AdminCorpsUnits)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_AdminCorpsUnits_Unit");
            });

            modelBuilder.Entity<Aircraft>(entity =>
            {
                entity.HasKey(e => e.AircraftGuid);

                entity.Property(e => e.AircraftGuid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.AltCode).HasMaxLength(50);

                entity.Property(e => e.AltName).HasMaxLength(50);

                entity.Property(e => e.AltSort).HasMaxLength(50);

                entity.Property(e => e.Cv).HasColumnName("CV");

                entity.Property(e => e.FirstDate).HasColumnType("date");

                entity.Property(e => e.Mark)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.SeriesCode).HasMaxLength(50);

                entity.Property(e => e.SeriesCodeSort).HasMaxLength(50);

                entity.Property(e => e.Sort).HasMaxLength(50);

                entity.Property(e => e.SortName).HasMaxLength(50);
            });

            modelBuilder.Entity<AltCode>(entity =>
            {
                entity.ToTable("AltCode");

                entity.Property(e => e.AltCodeId).HasMaxLength(50);

                entity.Property(e => e.AltCodeUse).HasMaxLength(50);

                entity.Property(e => e.IndexCode10).HasMaxLength(50);

                entity.Property(e => e.IndexCode20).HasMaxLength(50);

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Service).HasMaxLength(50);
            });

            modelBuilder.Entity<Base>(entity =>
            {
                entity.ToTable("Base");

                entity.Property(e => e.Afdcode)
                    .HasMaxLength(4)
                    .HasColumnName("AFDCode");

                entity.Property(e => e.AltName).HasMaxLength(255);

                entity.Property(e => e.City).HasMaxLength(255);

                entity.Property(e => e.CommissionedName).HasMaxLength(255);

                entity.Property(e => e.Faacode)
                    .HasMaxLength(5)
                    .HasColumnName("FAACode");

                entity.Property(e => e.Iatacode)
                    .HasMaxLength(3)
                    .HasColumnName("IATACode");

                entity.Property(e => e.Icaocode)
                    .HasMaxLength(4)
                    .HasColumnName("ICAOCode");

                entity.Property(e => e.Iso3166)
                    .HasMaxLength(10)
                    .HasColumnName("ISO3166");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Prefix).HasMaxLength(50);

                entity.Property(e => e.SortName)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Suffix).HasMaxLength(50);

                entity.HasOne(d => d.ParentBase)
                    .WithMany(p => p.InverseParentBase)
                    .HasForeignKey(d => d.ParentBaseId)
                    .HasConstraintName("FK_Base_Base");

                entity.HasOne(d => d.Ship)
                    .WithMany(p => p.Bases)
                    .HasForeignKey(d => d.ShipId)
                    .HasConstraintName("FK_Base_Ship");
            });

            modelBuilder.Entity<ConfigSetting>(entity =>
            {
                entity.HasKey(e => e.ConfigSetting1);

                entity.Property(e => e.ConfigSetting1)
                    .HasMaxLength(255)
                    .HasColumnName("ConfigSetting");

                entity.Property(e => e.ConfigValue).IsRequired();
            });

            modelBuilder.Entity<Dictionary>(entity =>
            {
                entity.HasKey(e => new { e.Key, e.Type });

                entity.ToTable("Dictionary");

                entity.Property(e => e.Key).HasMaxLength(255);

                entity.Property(e => e.Type).HasMaxLength(50);

                entity.Property(e => e.Value)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Document>(entity =>
            {
                entity.ToTable("Document");

                entity.Property(e => e.DocumentId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.FileType)
                    .IsRequired()
                    .HasMaxLength(5);

                entity.Property(e => e.Filename)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Folder)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Publisher)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Reference).HasMaxLength(255);

                entity.Property(e => e.Title)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<DocumentLink>(entity =>
            {
                entity.HasKey(e => new { e.DocumentId, e.LinkedId });

                entity.ToTable("DocumentLink");
            });

            modelBuilder.Entity<DocumentReference>(entity =>
            {
                entity.HasKey(e => new { e.DocumentId, e.Reference });

                entity.ToTable("DocumentReference");

                entity.Property(e => e.Reference).HasMaxLength(255);

                entity.Property(e => e.CurrentRef)
                    .IsRequired()
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Source)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<EquipmentOwner>(entity =>
            {
                entity.ToTable("EquipmentOwner");

                entity.Property(e => e.Quantity).HasColumnType("decimal(5, 1)");

                entity.HasOne(d => d.Aircraft)
                    .WithMany(p => p.EquipmentOwners)
                    .HasForeignKey(d => d.AircraftId)
                    .HasConstraintName("FK_EquipmentOwner_Aircraft");

                entity.HasOne(d => d.GroundEquipment)
                    .WithMany(p => p.EquipmentOwners)
                    .HasForeignKey(d => d.GroundEquipmentId)
                    .HasConstraintName("FK_EquipmentOwner_GroundEquipment");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.EquipmentOwners)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EquipmentOwner_Unit");
            });

            modelBuilder.Entity<GroundEquipment>(entity =>
            {
                entity.HasKey(e => e.EquipmentGuid);

                entity.ToTable("GroundEquipment");

                entity.Property(e => e.EquipmentGuid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.AltCode).HasMaxLength(50);

                entity.Property(e => e.AltName).HasMaxLength(255);

                entity.Property(e => e.AltSort).HasMaxLength(255);

                entity.Property(e => e.Designation)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.FamilyDesignation).HasMaxLength(50);

                entity.Property(e => e.Name).HasMaxLength(255);

                entity.Property(e => e.PrintName).HasMaxLength(50);

                entity.Property(e => e.SortName).HasMaxLength(255);

                entity.Property(e => e.Type).HasMaxLength(10);

                entity.HasOne(d => d.TypeNavigation)
                    .WithMany(p => p.GroundEquipments)
                    .HasForeignKey(d => d.Type)
                    .HasConstraintName("FK_GroundEquipment_GroundEquipment");
            });

            modelBuilder.Entity<GroundEquipmentType>(entity =>
            {
                entity.HasKey(e => e.GroundEquipmentTypeCode);

                entity.ToTable("GroundEquipmentType");

                entity.Property(e => e.GroundEquipmentTypeCode).HasMaxLength(10);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Mission>(entity =>
            {
                entity.ToTable("Mission");

                entity.Property(e => e.AltShortForm).HasMaxLength(50);

                entity.Property(e => e.DisplayName)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.FullName)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.MainMission).HasMaxLength(255);

                entity.Property(e => e.MissionVariant).HasMaxLength(255);

                entity.Property(e => e.ShortForm).HasMaxLength(50);

                entity.Property(e => e.SortOrder).HasMaxLength(255);

                entity.Property(e => e.Structure).HasMaxLength(50);
            });

            modelBuilder.Entity<MissionUnit>(entity =>
            {
                entity.HasKey(e => new { e.MissionId, e.UnitId });

                entity.ToTable("MissionUnit");

                entity.Property(e => e.MissionVariant).HasMaxLength(255);

                entity.HasOne(d => d.Mission)
                    .WithMany(p => p.MissionUnits)
                    .HasForeignKey(d => d.MissionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MissionUnit_Mission");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.MissionUnits)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MissionUnit_Unit");
            });

            modelBuilder.Entity<MissionUnitPlusUnitNumber>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("MissionUnit_plus_UnitNumber");

                entity.Property(e => e.MissionVariant).HasMaxLength(255);
            });

            modelBuilder.Entity<Organisation>(entity =>
            {
                entity.ToTable("Organisation");

                entity.Property(e => e.OrganisationId).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Rank>(entity =>
            {
                entity.HasKey(e => e.Symbol)
                    .HasName("PK__Symbol");

                entity.ToTable("Rank");

                entity.Property(e => e.Symbol).HasMaxLength(1);

                entity.Property(e => e.AirForce).HasMaxLength(255);

                entity.Property(e => e.AirForceRank).HasMaxLength(50);

                entity.Property(e => e.AirForceRankAbbrev).HasMaxLength(50);

                entity.Property(e => e.Army).HasMaxLength(255);

                entity.Property(e => e.ArmyRank).HasMaxLength(50);

                entity.Property(e => e.ArmyRankAbbrev).HasMaxLength(50);

                entity.Property(e => e.Civil).HasMaxLength(255);

                entity.Property(e => e.CivilRank).HasMaxLength(50);

                entity.Property(e => e.CivilRankAbbrev).HasMaxLength(50);

                entity.Property(e => e.Joint).HasMaxLength(255);

                entity.Property(e => e.MarineRank).HasMaxLength(50);

                entity.Property(e => e.MarineRankAbbrev).HasMaxLength(50);

                entity.Property(e => e.Navy).HasMaxLength(255);

                entity.Property(e => e.NavyRank).HasMaxLength(50);

                entity.Property(e => e.NavyRankAbbrev).HasMaxLength(50);

                entity.Property(e => e.Rank1)
                    .HasMaxLength(8)
                    .HasColumnName("Rank");
            });

            modelBuilder.Entity<Relationship>(entity =>
            {
                entity.HasKey(e => new { e.RelFromUnitId, e.RelToUnitId });

                entity.ToTable("Relationship");

                entity.Property(e => e.RelationshipGuid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.RelationshipId).ValueGeneratedOnAdd();

                entity.HasOne(d => d.RelFromUnit)
                    .WithMany(p => p.RelationshipRelFromUnits)
                    .HasForeignKey(d => d.RelFromUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RelationshipFrom_Unit");

                entity.HasOne(d => d.RelToUnit)
                    .WithMany(p => p.RelationshipRelToUnits)
                    .HasForeignKey(d => d.RelToUnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RelationshipTo_Unit");

                entity.HasOne(d => d.RelTypeIdxNavigation)
                    .WithMany(p => p.Relationships)
                    .HasForeignKey(d => d.RelTypeIdx)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Relationship_RelationshipType");
            });

            modelBuilder.Entity<RelationshipType>(entity =>
            {
                entity.ToTable("RelationshipType");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<Service>(entity =>
            {
                entity.ToTable("Service");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<ServiceType>(entity =>
            {
                entity.ToTable("ServiceType");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Ship>(entity =>
            {
                entity.ToTable("Ship");

                entity.Property(e => e.ShipId).HasDefaultValueSql("(newid())");

                entity.Property(e => e.AltHcs)
                    .HasMaxLength(50)
                    .HasColumnName("AltHCS");

                entity.Property(e => e.AltHcsnumber).HasColumnName("AltHCSNumber");

                entity.Property(e => e.AltName).HasMaxLength(255);

                entity.Property(e => e.Commissioned).HasColumnType("date");

                entity.Property(e => e.Decommissioned).HasColumnType("date");

                entity.Property(e => e.Hcs)
                    .HasMaxLength(50)
                    .HasColumnName("HCS");

                entity.Property(e => e.Hcsnumber).HasColumnName("HCSNumber");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.PennantCode).HasMaxLength(5);

                entity.HasOne(d => d.NewShip)
                    .WithMany(p => p.InverseNewShip)
                    .HasForeignKey(d => d.NewShipId)
                    .HasConstraintName("FK_Ship_NewShip");

                entity.HasOne(d => d.ShipPrefix)
                    .WithMany(p => p.Ships)
                    .HasForeignKey(d => d.ShipPrefixId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Ship_ShipPrefix");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.Ships)
                    .HasForeignKey(d => d.UnitId)
                    .HasConstraintName("FK_Ship_Unit");
            });

            modelBuilder.Entity<ShipClass>(entity =>
            {
                entity.ToTable("ShipClass");

                entity.Property(e => e.ClassCodeHcs)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("ClassCodeHCS");

                entity.Property(e => e.ClassName)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.ModName).HasMaxLength(255);

                entity.HasOne(d => d.ModFromNavigation)
                    .WithMany(p => p.InverseModFromNavigation)
                    .HasForeignKey(d => d.ModFrom)
                    .HasConstraintName("FK_ShipClass_Mod");
            });

            modelBuilder.Entity<ShipClassMember>(entity =>
            {
                entity.HasKey(e => new { e.ShipId, e.ShipClassId });

                entity.ToTable("ShipClassMember");

                entity.HasOne(d => d.ShipClass)
                    .WithMany(p => p.ShipClassMembers)
                    .HasForeignKey(d => d.ShipClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShipClassMember_ShipClass");

                entity.HasOne(d => d.Ship)
                    .WithMany(p => p.ShipClassMembers)
                    .HasForeignKey(d => d.ShipId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ShipClassMember_Ship");
            });

            modelBuilder.Entity<ShipPrefix>(entity =>
            {
                entity.ToTable("ShipPrefix");

                entity.Property(e => e.InFull).HasMaxLength(255);

                entity.Property(e => e.ShipPrefix1)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("ShipPrefix");
            });

            modelBuilder.Entity<SortOrder>(entity =>
            {
                entity.ToTable("SortOrder");

                entity.HasIndex(e => e.SearchTerm, "AK_UniqueSearchTerm")
                    .IsUnique();

                entity.Property(e => e.Description).HasMaxLength(255);

                entity.Property(e => e.SearchTerm)
                    .IsRequired()
                    .HasMaxLength(255);
            });

            modelBuilder.Entity<TaskForce>(entity =>
            {
                entity.HasKey(e => e.UnitId);

                entity.ToTable("TaskForce");

                entity.Property(e => e.UnitId).ValueGeneratedNever();

                entity.Property(e => e.SortName)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.TaskForceName).HasMaxLength(255);

                entity.HasOne(d => d.Unit)
                    .WithOne(p => p.TaskForce)
                    .HasForeignKey<TaskForce>(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_TaskForce_Unit");
            });

            modelBuilder.Entity<Tennant>(entity =>
            {
                entity.HasKey(e => new { e.BaseId, e.UnitId });

                entity.ToTable("Tennant");

                entity.Property(e => e.TennancyId).ValueGeneratedOnAdd();

                entity.HasOne(d => d.Base)
                    .WithMany(p => p.Tennants)
                    .HasForeignKey(d => d.BaseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tennant_Base");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.Tennants)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tennant_Unit");
            });

            modelBuilder.Entity<TennantPlusUnitNumber>(entity =>
            {
                entity.HasNoKey();

                entity.ToView("Tennant_plus_UnitNumber");
            });

            modelBuilder.Entity<Translation>(entity =>
            {
                entity.ToTable("Translation");

                entity.Property(e => e.English)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.Property(e => e.Language)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.Translation1)
                    .IsRequired()
                    .HasMaxLength(255)
                    .HasColumnName("Translation");
            });

            modelBuilder.Entity<Unit>(entity =>
            {
                entity.ToTable("Unit");

                entity.Property(e => e.CommandName).HasMaxLength(255);

                entity.Property(e => e.Format).HasMaxLength(50);

                entity.Property(e => e.Language).HasMaxLength(5);

                entity.Property(e => e.LegacyMissionName).HasMaxLength(255);

                entity.Property(e => e.Letter)
                    .HasMaxLength(1)
                    .IsUnicode(false)
                    .IsFixedLength(true);

                entity.Property(e => e.MissionName).HasMaxLength(255);

                entity.Property(e => e.NickName).HasMaxLength(255);

                entity.Property(e => e.RankSymbol)
                    .IsRequired()
                    .HasMaxLength(1);

                entity.Property(e => e.TerritorialDesignation).HasMaxLength(255);

                entity.Property(e => e.UniqueName).HasMaxLength(255);

                entity.Property(e => e.UnitGuid).HasDefaultValueSql("(newid())");

                entity.Property(e => e.UnitObject).HasMaxLength(255);

                entity.Property(e => e.UnitTypeVariant).HasMaxLength(255);

                entity.HasOne(d => d.AdminCorpsNavigation)
                    .WithMany(p => p.Units)
                    .HasForeignKey(d => d.AdminCorpsId)
                    .HasConstraintName("FK_Unit_AdminCorps");
            });

            modelBuilder.Entity<UnitIndex>(entity =>
            {
                entity.ToTable("UnitIndex");

                entity.HasIndex(e => e.IndexCode, "IX_IndexCode")
                    .IsUnique();

                entity.Property(e => e.IndexCode)
                    .IsRequired()
                    .HasMaxLength(255);

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.UnitIndices)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_UnitIndex_Unit");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
