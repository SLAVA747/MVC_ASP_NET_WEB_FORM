using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace numbers_book
{
    public partial class TB_DBContext : DbContext
    {
        public TB_DBContext()
        {
        }

        public TB_DBContext(DbContextOptions<TB_DBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<Employees> Employees { get; set; }
        public virtual DbSet<Numbers> Numbers { get; set; }
        public virtual DbSet<Post> Post { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseNpgsql("Host=localhost;Port=5432;Database=TB_DB;Username=postgres;Password=1234567890");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.0-rtm-35687");

            modelBuilder.Entity<Company>(entity =>
            {
                entity.ToTable("company");

                entity.Property(e => e.CompanyId)
                    .HasColumnName("company_id")
                    .ValueGeneratedNever();

                entity.Property(e => e.CompanyName)
                    .IsRequired()
                    .HasColumnName("company_name")
                    .HasMaxLength(300);

                entity.Property(e => e.CompanySite)
                    .IsRequired()
                    .HasColumnName("company_site")
                    .HasMaxLength(300);

                entity.Property(e => e.CompanyTelephone)
                    .IsRequired()
                    .HasColumnName("company_telephone")
                    .HasMaxLength(300);
            });

            modelBuilder.Entity<Employees>(entity =>
            {
                entity.ToTable("employees");

                entity.Property(e => e.EmployeesId)
                    .HasColumnName("employees_id")
                    .ValueGeneratedNever();

                entity.Property(e => e.EmployeesDate)
                    .HasColumnName("employees_date")
                    .HasColumnType("date");

                entity.Property(e => e.EmployeesFullNames)
                    .IsRequired()
                    .HasColumnName("employees_full_names")
                    .HasMaxLength(300);
            });

            modelBuilder.Entity<Numbers>(entity =>
            {
                entity.HasKey(e => e.IdNumber)
                    .HasName("book_pk");

                entity.ToTable("numbers");

                entity.Property(e => e.IdNumber)
                    .HasColumnName("id_number")
                    .ValueGeneratedNever();

                entity.Property(e => e.CompanyId).HasColumnName("company_id");

                entity.Property(e => e.EmployeesId).HasColumnName("employees_id");

                entity.Property(e => e.PostId).HasColumnName("post_id");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.Numbers)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("numbers_company_fk");

                entity.HasOne(d => d.Employees)
                    .WithMany(p => p.Numbers)
                    .HasForeignKey(d => d.EmployeesId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("numbers_employees_fk");

                entity.HasOne(d => d.Post)
                    .WithMany(p => p.Numbers)
                    .HasForeignKey(d => d.PostId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("numbers_post_fk");
            });

            modelBuilder.Entity<Post>(entity =>
            {
                entity.ToTable("post");

                entity.Property(e => e.PostId)
                    .HasColumnName("post_id")
                    .ValueGeneratedNever();

                entity.Property(e => e.PostContacts)
                    .IsRequired()
                    .HasColumnName("post_contacts")
                    .HasMaxLength(300);

                entity.Property(e => e.PostName)
                    .IsRequired()
                    .HasColumnName("post_name")
                    .HasMaxLength(300);

                entity.Property(e => e.PostTypeContacts)
                    .HasColumnName("post_type_contacts")
                    .HasMaxLength(300);
            });
        }
    }
}
