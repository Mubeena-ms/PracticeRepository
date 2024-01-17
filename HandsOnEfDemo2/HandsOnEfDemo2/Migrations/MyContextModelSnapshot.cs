﻿// <auto-generated />
using System;
using HandsOnEfDemo2.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace HandsOnEfDemo2.Migrations
{
    [DbContext(typeof(MyContext))]
    partial class MyContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("HandsOnEfDemo2.Entities.Marks", b =>
                {
                    b.Property<Guid>("MarkId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("Exam")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("varchar");

                    b.Property<int>("StudentId")
                        .HasColumnType("int");

                    b.Property<int?>("TotalMarks")
                        .HasColumnType("int");

                    b.HasKey("MarkId");

                    b.HasIndex("StudentId");

                    b.ToTable("tbl_marks");
                });

            modelBuilder.Entity("HandsOnEfDemo2.Entities.Student", b =>
                {
                    b.Property<int>("Id")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(30)
                        .HasColumnType("varchar")
                        .HasColumnName("Name");

                    b.Property<string>("Section")
                        .IsRequired()
                        .HasMaxLength(2)
                        .HasColumnType("char");

                    b.Property<string>("Std")
                        .IsRequired()
                        .HasMaxLength(30)
                        .HasColumnType("varchar")
                        .HasColumnName("Class");

                    b.HasKey("Id");

                    b.ToTable("Students");
                });

            modelBuilder.Entity("HandsOnEfDemo2.Entities.Marks", b =>
                {
                    b.HasOne("HandsOnEfDemo2.Entities.Student", "Student")
                        .WithMany()
                        .HasForeignKey("StudentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Student");
                });
#pragma warning restore 612, 618
        }
    }
}
